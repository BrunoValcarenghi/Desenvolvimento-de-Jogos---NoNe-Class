number = 0

troca = function(){

	layer_destroy_instances("instances")

	switch number{

		case 0: instance_create_layer(683, 384, "Instances", atv_0); break;
		case 1: instance_create_layer(683, 384, "Instances", atv_6); break;
		case 2: instance_create_layer(683, 384, "Instances", atv_7); break;
		case 3: instance_create_layer(683, 384, "Instances", atv_8); break;
		case 4: instance_create_layer(683, 384, "Instances", atv_9); break;
		case 5: instance_create_layer(683, 384, "Instances", atv_10); break;
	}

}

troca()