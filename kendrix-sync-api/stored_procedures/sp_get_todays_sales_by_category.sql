DELIMITER //

CREATE PROCEDURE sp_get_todays_sales_by_category(
    IN p_tenant_id INT
)
BEGIN
  SELECT
      COALESCE(k.Emri, 'Pa kategori') AS Kategoria,
      SUM( (p.Cmimi * IFNULL(p.Sasia,1)) - IFNULL(p.Rabati,0) ) AS TotalSales
  FROM Porosia p
  LEFT JOIN ArtikulliBaze pro
         ON pro.tenant_id = p.tenant_id AND pro.Id = p.ProduktiId
  LEFT JOIN Kategoria k
         ON k.tenant_id = pro.tenant_id AND k.Id = pro.KategoriaId
  WHERE p.tenant_id = p_tenant_id
    AND DATE(p.DataEKrijimit) = CURDATE()
    AND (p.Fshire IS NULL OR p.Fshire = 0)
  GROUP BY Kategoria
  ORDER BY TotalSales DESC;
END //

DELIMITER ;