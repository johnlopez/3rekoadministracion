<?php
/* @var $this EscritorioAdministradorController */
/* @var $data EscritorioAdministrador */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />


</div>