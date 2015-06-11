SELECT PRIV.*
FROM 	
		dato_login_administrador D,
        usuario_administrador U,
	    usuario_administrador_has_rol_administrador UR,
		rol_administrador R,
        rol_administrador_has_permiso_administrador RP,
        permiso_administrador P,
        permiso_administrador_has_privilegio_administrador PP,
        privilegio_administrador PRIV

WHERE U.dato_login_administrador_id = D.id
AND UR.usuario_administrador_id = U.id
AND UR.rol_administrador_id = R.id
AND RP.rol_administrador_id = R.id
AND RP.permiso_administrador_id = P.id
AND PP.permiso_administrador_id = P.id
AND PP.privilegio_administrador_id = PRIV.id

AND D.usuario='john'
AND P.nombre='administracionusuarioadministrador'