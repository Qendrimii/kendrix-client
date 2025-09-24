Kendrix Sync Architecture Overview
Introduction
This document outlines the current architecture of the Kendrix synchronization system, which consists of two main components: a Windows service client and a PHP-based API server. The document also proposes improvements to simplify the authentication process while maintaining security and data integrity.

Current Architecture
System Components
<img alt="Kendrix Sync Architecture" src="https://via.placeholder.com/800x400?text=Kendrix+Sync+Architecture+Diagram">

Kendrix Sync Service (Windows Client)

Windows service written in C#
Runs on local client machines
Handles data synchronization between local database and central server
Manages authentication through JWT tokens
Contains models for business entities (Fatura, Stoku, Porosia, etc.)
Kendrix Sync API (Server)

PHP-based API running on central server
Handles authentication and authorization
Processes synchronization requests
Manages data persistence to central database
Provides health endpoints and administrative functions
Data Flow
Client authenticates with server using JWT
Client pushes local changes to server
Client pulls updates from server
Server validates and processes data
Server responds with status and/or updated data
Current Authentication Process
The current authentication process uses JWT (JSON Web Tokens) with the following flow:

Initial setup requires running generate_token.php to create credentials
Credentials are stored in the client's App.config file
The Windows service uses JwtService.cs to handle token lifecycle
Each API request includes the JWT token in the Authorization header
Server-side AuthAPI.php and JWT.php validate incoming tokens
Token renewal happens through specific API endpoints
Pain Points
Token generation and renewal process is manual and error-prone
Configuration files need frequent updates (update_sync_config.bat)
Auth fixes are sometimes required (fix_auth.php)
Multiple setup steps create complexity for deployment
Limited token revocation capabilities
Proposed Improvements
Authentication Simplification
Implement OAuth 2.0 Client Credentials Flow

Replace custom JWT implementation with industry standard
Standardize token request and validation processes
Improve token lifecycle management
Centralized Configuration Management

Move authentication settings to a central location
Implement automatic configuration updates
Reduce need for manual intervention
Enhanced Security

Add token revocation capabilities
Implement IP-based restrictions
Add rate limiting for authentication attempts
Enforce strong encryption for all credentials
Data Integrity Enhancements
Idempotent API Operations

Ensure all sync operations are idempotent
Implement request IDs to prevent duplicate processing
Expand on existing IdempotencyService.php
Transaction Management

Improve error handling during sync operations
Implement atomic updates where possible
Enhance the existing transaction management
Audit Logging

Add comprehensive logging for all sync operations
Track authentication events
Provide tools for troubleshooting sync issues
Implementation Roadmap
Phase 1: Auth Modernization

Replace custom JWT with OAuth 2.0 implementation
Update client and server components
Implement token management improvements
Phase 2: Configuration Streamlining

Create centralized configuration service
Automate client configuration updates
Simplify deployment process
Phase 3: Data Integrity Enhancements

Implement comprehensive transaction management
Enhance idempotency guarantees
Add audit logging capabilities
Conclusion
By implementing these improvements, we can significantly simplify the authentication process while enhancing security and data integrity. The proposed changes will reduce maintenance overhead, improve troubleshooting capabilities, and create a more robust synchronization system overall.