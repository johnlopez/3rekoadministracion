<?php
/* @var $this EscritorioAdministradorController */
/* @var $model EscritorioAdministrador */

$this->breadcrumbs=array(
	'Escritorio Administradors'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List EscritorioAdministrador', 'url'=>array('index')),
	array('label'=>'Create EscritorioAdministrador', 'url'=>array('create')),
	array('label'=>'View EscritorioAdministrador', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage EscritorioAdministrador', 'url'=>array('admin')),
);
?>

<h1>Update EscritorioAdministrador <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>