use 3rekoadministracion;

create procedure obtener_permiso_usuario(nuevo_usuario varchar(50))

SELECT P.*
FROM 	
		dato_login_administrador D,
        usuario_administrador U,
	    usuario_administrador_has_rol_administrador UR,
		rol_administrador R,
        rol_administrador_has_permiso_administrador RP,
        permiso_administrador P

WHERE U.dato_login_administrador_id = D.id
AND UR.usuario_administrador_id = U.id
AND UR.rol_administrador_id = R.id
AND RP.rol_administrador_id = R.id
AND RP.permiso_administrador_id = P.id

AND D.usuario=nuevo_usuario;



call obtener_permiso_usuario('john');

drop procedure obtener_permiso_usuario;