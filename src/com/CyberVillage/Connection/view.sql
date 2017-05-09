CREATE VIEW room_rent AS 
	select room.room_id AS room_id,
    (room.squarefeet * floor.rent) AS rent 
    from room inner join floor on room.floor_id = floor.floor_id;
    
    SELECT * FROM `rent_company` WHERE DATEDIFF(CURDATE(),`due_date`) >= 30