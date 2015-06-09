<?php
/* @var $this EscritorioAdministradorController */
/* @var $model EscritorioAdministrador */

$this->breadcrumbs=array(
	'Escritorio Administradors'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List EscritorioAdministrador', 'url'=>array('index')),
	array('label'=>'Create EscritorioAdministrador', 'url'=>array('create')),
	array('label'=>'Update EscritorioAdministrador', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete EscritorioAdministrador', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage EscritorioAdministrador', 'url'=>array('admin')),
);
?>

<h1>View EscritorioAdministrador #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
	),
)); ?>
