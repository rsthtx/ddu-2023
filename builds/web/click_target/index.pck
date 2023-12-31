GDPC                `                                                                         X   res://.godot/exported/133200997/export-1b91c6d84edd55c8f236422b79e9a713-click_target.scn�      )      �5� �Dq  �~��.    T   res://.godot/exported/133200997/export-24363676599b3892c2183c1daf0ffd00-player.scn  �      O      �3v���+z�>*�9    X   res://.godot/exported/133200997/export-571ecc32e5ed3e4e843bdfc94c48e666-click_demo.scn  �      S      K�~|�AJ�sہ�    T   res://.godot/exported/133200997/export-6f6454eff11cd4fde22e7dec165e1466-obstacle.scn0      �      sg<ʤ%�b��=�    P   res://.godot/exported/133200997/export-a11bb713ad30a6fb5ac96b99d2c08ce9-main.scn�             5��r}L02r_$�*%    ,   res://.godot/global_script_class_cache.cfg  �,             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex      �      �̛�*$q�*�́        res://.godot/uid_cache.bin  �0            Z�P��P'(85P�%`�        res://click_target/ClickDemo.gd         �      �E��C��؄?�����    (   res://click_target/click_demo.tscn.remap�*      g       ���B[�E9XF�`r��    $   res://click_target/click_target.gd         t      irWID.̦s>"|�[e�    ,   res://click_target/click_target.tscn.remap  0+      i       X�����s�o�0��R�4       res://icon.svg  -      �      C��=U���^Qu��U3       res://icon.svg.import   �)      �       8��1�$n�p�;�J    ,   res://obstacle_destruction/main.tscn.remap  �+      a       ��)����SL�Vfu    (   res://obstacle_destruction/obstacle.gd  �      @      mRr9˧������hC�f    0   res://obstacle_destruction/obstacle.tscn.remap  ,      e       ڳoX��f�	�϶D�x    $   res://obstacle_destruction/player.gd�      �      sf,�ӊ�z?��!�    ,   res://obstacle_destruction/player.tscn.remap�,      c       u�x��R����*��N       res://project.binary�1      >      ��\)��?�s"h�&�    extends Node2D
@onready var mover: Sprite2D = $Mover

func _ready() -> void:
	var targets = [$ClickTarget, $ClickTarget2, $ClickTarget3]
	
	for t in targets:
		t.pressed.connect(_on_click_target_pressed)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("press anything")


func _on_click_target_pressed(pos) -> void:
#	$Mover.position = pos
	var movement_done = func (): print("Movement towards ", pos, " done!")

	create_tween() \
		.tween_property(mover,"position", pos, 2.0) \
		.set_trans(Tween.TRANS_ELASTIC) \
		.set_ease(Tween.EASE_OUT) \
		.finished.connect(movement_done)
		
            RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script     res://click_target/ClickDemo.gd ��������   PackedScene %   res://click_target/click_target.tscn �<w�H�tt
   Texture2D    res://icon.svg =J|?�c=      local://PackedScene_7o0x4 �         PackedScene          	         names "      
   ClickDemo    script    Node2D    ClickTarget 	   position    ClickTarget2    ClickTarget3    Mover 	   modulate    texture 	   Sprite2D    	   variants                          
     ^C  4C
    @&D ��C
    �D  �B   ���>  �?���>  �?
     �C ��C               node_count             nodes     1   ��������       ����                      ���                           ���                           ���                           
      ����               	                conn_count              conns               node_paths              editable_instances              version             RSRC             extends Sprite2D
@onready var area_2d: Area2D = $Area2D

signal pressed(pos : Vector2)


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("collision pressed")
		pressed.emit(position)
		
#		print(area_2d.global_position)
		
            RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled    
   Texture2D    res://icon.svg =J|?�c=   Script #   res://click_target/click_target.gd ��������      local://RectangleShape2D_sb5am �         local://PackedScene_67tvk �         RectangleShape2D       
      C  C         PackedScene          	         names "   
      ClickTarget    texture    script 	   Sprite2D    Area2D    CollisionShape2D 	   position    shape    _on_area_2d_input_event    input_event    	   variants                          
         �?                node_count             nodes        ��������       ����                                  ����                     ����                         conn_count             conns               	                       node_paths              editable_instances              version             RSRC       RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       PackedScene '   res://obstacle_destruction/player.tscn _��cN�D   PackedScene )   res://obstacle_destruction/obstacle.tscn B���;�"`      local://PackedScene_386ir h         PackedScene          	         names "   	      Main    Node2D    Player 	   position    Player2 
   direction    Player3 	   Obstacle 
   Obstacle2    	   variants                 
     VC  xC
    ��C  pB
         �?
     �B  �C         
      D ��C
     D  D      node_count             nodes     6   ��������       ����                ���                            ���                                  ���                            ���                           ���                         conn_count              conns               node_paths              editable_instances              version             RSRCextends Area2D
@onready var timer: Timer = $Timer

func _on_area_entered(area: Area2D) -> void:
	print("obstactle was hit")

	if area.is_in_group("player"):
		print("hit by player")
		# start decreasing health
		timer.start()

var health = 3
func _on_timer_timeout() -> void:
	health -= 1
	if health < 0:
		queue_free()
RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    radius    script 	   _bundled       Script '   res://obstacle_destruction/obstacle.gd ��������
   Texture2D    res://icon.svg =J|?�c=      local://CircleShape2D_r6ixl �         local://PackedScene_et7gi �         CircleShape2D          �(yB         PackedScene          	         names "      	   Obstacle    script 	   obstacle    Area2D    Icon 	   modulate    texture 	   Sprite2D    CollisionShape2D    shape    Timer    _on_area_entered    area_entered    _on_timer_timeout    timeout    	   variants                    ���>��;?���>  �?                         node_count             nodes     %   ��������       ����                              ����                                 ����   	                  
   
   ����              conn_count             conns                                                               node_paths              editable_instances              version             RSRC              extends Area2D

@export var direction = Vector2.RIGHT
@export var speed : float = 50.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * delta * speed


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("obstacle"):
		speed = 0
	

func _on_area_exited(area: Area2D) -> void:
	print("exited")
	if area.is_in_group("obstacle"):
		print("obstacle exited")
		speed = 50.0
       RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    radius    script 	   _bundled       Script %   res://obstacle_destruction/player.gd ��������
   Texture2D    res://icon.svg =J|?�c=      local://CircleShape2D_acm48 �         local://PackedScene_euk3f �         CircleShape2D          ��xB         PackedScene          	         names "         Player    script    player    Area2D    Icon    texture 	   Sprite2D    CollisionShape2D    shape    _on_area_entered    area_entered    _on_area_exited    area_exited    	   variants                                          node_count             nodes        ��������       ����                              ����                           ����                   conn_count             conns                
   	                                             node_paths              editable_instances              version             RSRC GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://b4a2ytsm6h0yb"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                [remap]

path="res://.godot/exported/133200997/export-571ecc32e5ed3e4e843bdfc94c48e666-click_demo.scn"
         [remap]

path="res://.godot/exported/133200997/export-1b91c6d84edd55c8f236422b79e9a713-click_target.scn"
       [remap]

path="res://.godot/exported/133200997/export-a11bb713ad30a6fb5ac96b99d2c08ce9-main.scn"
               [remap]

path="res://.godot/exported/133200997/export-6f6454eff11cd4fde22e7dec165e1466-obstacle.scn"
           [remap]

path="res://.godot/exported/133200997/export-24363676599b3892c2183c1daf0ffd00-player.scn"
             list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             ?�L*
�BN"   res://click_target/click_demo.tscn�<w�H�tt$   res://click_target/click_target.tscn���l7$   res://obstacle_destruction/main.tscnB���;�"`(   res://obstacle_destruction/obstacle.tscn_��cN�D&   res://obstacle_destruction/player.tscn=J|?�c=   res://icon.svg              ECFG      application/config/name         DDU_godot_demo     application/run/main_scene,      "   res://click_target/click_demo.tscn     application/config/features   "         4.1    Mobile     application/config/icon         res://icon.svg  #   rendering/renderer/rendering_method         mobile    