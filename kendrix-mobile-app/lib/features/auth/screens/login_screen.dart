import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/auth_repository.dart';
import '../../../core/auth/token_storage.dart';
import '../../../core/i18n/l10n.dart';
import '../models/login_request.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final tenantKeyController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final obscurePassword = useState(true);
    final showTenantKeyField = useState(false);
    final rememberTenantKey = useState(false);
    
    final authState = ref.watch(authStateProvider);
    final tokenStorage = ref.watch(tokenStorageProvider);

    // Load saved tenant key on init
    useEffect(() {
      tokenStorage.getRememberedTenantKey().then((savedKey) {
        if (savedKey != null) {
          tenantKeyController.text = savedKey;
          rememberTenantKey.value = true;
        }
      });
      return null;
    }, []);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo and title
                  Icon(
                    Icons.business,
                    size: 80,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.appTitle,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Point of Sale Management System',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  // Email field
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: l10n.email,
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!value.contains('@')) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password field
                  TextFormField(
                    controller: passwordController,
                    obscureText: obscurePassword.value,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: l10n.password,
                      prefixIcon: const Icon(Icons.lock_outlined),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        onPressed: () {
                          obscurePassword.value = !obscurePassword.value;
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) => _handleLogin(
                      context,
                      ref,
                      formKey,
                      emailController,
                      passwordController,
                      tenantKeyController,
                      rememberTenantKey.value,
                      tokenStorage,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tenant Key field (shown when options are expanded)
                  if (showTenantKeyField.value) ...[
                    TextFormField(
                      controller: tenantKeyController,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: 'Tenant Key',
                        hintText: 'e.g., KENDRIX-CLIENT-001',
                        prefixIcon: const Icon(Icons.business_outlined),
                        helperText: 'Enter your organization\'s tenant key',
                      ),
                      validator: (value) {
                        if (showTenantKeyField.value && (value == null || value.isEmpty)) {
                          return 'Tenant key is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    
                    // Remember tenant key checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: rememberTenantKey.value,
                          onChanged: (value) {
                            rememberTenantKey.value = value ?? false;
                          },
                        ),
                        const Text('Remember tenant key'),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Options button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          showTenantKeyField.value = !showTenantKeyField.value;
                        },
                        icon: Icon(
                          showTenantKeyField.value 
                            ? Icons.keyboard_arrow_up 
                            : Icons.keyboard_arrow_down
                        ),
                        label: Text(showTenantKeyField.value ? 'Hide Options' : 'Options'),
                      ),
                      if (showTenantKeyField.value)
                        TextButton(
                          onPressed: () {
                            tenantKeyController.clear();
                            rememberTenantKey.value = false;
                            tokenStorage.clearRememberedTenantKey();
                          },
                          child: const Text('Clear Saved'),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Login button
                  FilledButton(
                    onPressed: authState.isLoading
                        ? null
                        : () => _handleLogin(
                              context,
                              ref,
                              formKey,
                              emailController,
                              passwordController,
                              tenantKeyController,
                              rememberTenantKey.value,
                              tokenStorage,
                            ),
                    child: authState.isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(l10n.login),
                  ),
                  const SizedBox(height: 16),

                  // Forgot password
                  TextButton(
                    onPressed: () {
                      // TODO: Implement forgot password
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Forgot password feature coming soon'),
                        ),
                      );
                    },
                    child: Text(l10n.forgotPassword),
                  ),

                  // Error message
                  if (authState.error != null) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.errorContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Theme.of(context).colorScheme.onErrorContainer,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              authState.error!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onErrorContainer,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // Debug info in development
                  if (!const bool.fromEnvironment('dart.vm.product')) ...[
                    const SizedBox(height: 32),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Debug Info',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Default credentials:\nEmail: admin@kendrix.com\nPassword: password',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin(
    BuildContext context,
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController tenantKeyController,
    bool rememberTenantKey,
    TokenStorage tokenStorage,
  ) async {
    if (!formKey.currentState!.validate()) return;

    final tenantKey = tenantKeyController.text.trim();
    
    final request = LoginRequest(
      email: emailController.text.trim(),
      password: passwordController.text,
      tenantKey: tenantKey.isNotEmpty ? tenantKey : null,
    );

    try {
      await ref.read(authStateProvider.notifier).login(request);
      
      // Manage the "remember tenant key" preference for form pre-filling
      if (rememberTenantKey && tenantKey.isNotEmpty) {
        await tokenStorage.setRememberedTenantKey(tenantKey);
      } else if (!rememberTenantKey) {
        await tokenStorage.clearRememberedTenantKey();
      }
      
      // The tenant key for API calls is automatically saved by AuthRepository
      
      // Check if login was successful
      final authState = ref.read(authStateProvider);
      if (authState.isAuthenticated && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login successful! Welcome ${authState.user?.email}'),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
        
        // Manually redirect to dashboard after successful login
        if (context.mounted) {
          context.go('/dashboard');
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed: ${e.toString()}'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }
}