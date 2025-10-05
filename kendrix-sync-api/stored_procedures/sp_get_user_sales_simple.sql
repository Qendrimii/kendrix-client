DELIMITER //

CREATE PROCEDURE sp_get_user_sales_simple(
    IN p_tenant_id INT,
    IN p_from DATE,
    IN p_to DATE
)
BEGIN
  SELECT 
      s.Id,
      s.Username,
      SUM(p.Cmimi * IFNULL(p.Sasia,1)) AS Shuma,
      DATE(p.DataEKrijimit) AS `Data`
  FROM Porosia p
  INNER JOIN Shfrytezuesi s
      ON s.tenant_id = p.tenant_id
     AND s.Id = p.ShfrytezuesiId
  WHERE p.tenant_id = p_tenant_id
    AND (p_from IS NULL OR DATE(p.DataEKrijimit) >= p_from)
    AND (p_to   IS NULL OR DATE(p.DataEKrijimit) <= p_to)
    AND s.Id <> 1
  GROUP BY s.Id, s.Username, DATE(p.DataEKrijimit)
  ORDER BY `Data` DESC;
END //

DELIMITER ;