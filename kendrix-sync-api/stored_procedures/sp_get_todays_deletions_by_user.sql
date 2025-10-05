DELIMITER //

CREATE PROCEDURE sp_get_todays_deletions_by_user(
    IN p_tenant_id INT
)
BEGIN
    SELECT
        s.Username AS Shfrytezuesi,
        COUNT(dl.Id) AS TotalDeleted
    FROM Shfrytezuesi s
    LEFT JOIN DeletedLogs dl ON dl.UserId = s.Id AND DATE(dl.DeletionDate) = CURDATE() AND dl.tenant_id = p_tenant_id
    WHERE s.tenant_id = p_tenant_id
    GROUP BY s.Username
    ORDER BY TotalDeleted DESC;
END //

DELIMITER ;

