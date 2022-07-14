SELECT d1.*
FROM doctors d1
JOIN doctors d2
	ON d1.id <> d2.id and d1.hospital = d2.hospital and d1.speciality <> d2.speciality