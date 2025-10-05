DELIMITER //

CREATE PROCEDURE sp_get_fatura_list(
    IN p_tenant_id INT,
    IN p_from DATE,
    IN p_to DATE
)
BEGIN
  SELECT
    f.NrFatures                    AS NrFatures,
    f.Data                   AS `Data`,
    s.Emertimi                     AS Subjekti,
    SUM(p.Cmimi * IFNULL(p.Sasia,1)) AS Totali
  FROM Fatura f
  LEFT JOIN Subjektet s
         ON s.tenant_id = f.tenant_id AND s.Id = f.SubjektiId
  INNER JOIN Porosia p
         ON p.tenant_id = f.tenant_id AND p.FaturaId = f.Id
        AND (p.Fshire IS NULL OR p.Fshire = 0)
  WHERE f.tenant_id = p_tenant_id
    AND (f.Fshire IS NULL OR f.Fshire = 0)
    AND (p_from IS NULL OR DATE(f.Data) >= p_from)
    AND (p_to   IS NULL OR DATE(f.Data) <= p_to)
  GROUP BY
    f.Id,
    f.NrFatures,
    DATE(f.Data),
    s.Emertimi
  ORDER BY `Data` DESC;
END //

DELIMITER ;