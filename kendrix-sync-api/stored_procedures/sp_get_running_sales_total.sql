DELIMITER //

CREATE PROCEDURE sp_get_running_sales_total(
    IN p_tenant_id INT
)
BEGIN
  WITH SalesCTE AS (
    SELECT
      ff.Id                                 AS Id,
      COALESCE(p.ShumaPaguar, 0)            AS Shuma,
      ROW_NUMBER() OVER (ORDER BY ff.Id)    AS SaleNumber
    FROM Fatura ff
    LEFT JOIN Pagesat p
           ON p.tenant_id = ff.tenant_id AND p.Id = ff.PagesaId
    WHERE ff.tenant_id = p_tenant_id
      AND DATE(ff.Data) = CURDATE()
      AND (ff.Fshire IS NULL OR ff.Fshire = 0)
  )
  SELECT
      SaleNumber,
      Id,
      Shuma,
      SUM(Shuma) OVER (ORDER BY SaleNumber
                        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
  FROM SalesCTE
  ORDER BY SaleNumber;
END //

DELIMITER ;