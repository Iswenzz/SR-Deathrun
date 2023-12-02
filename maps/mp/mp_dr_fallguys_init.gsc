main()
{
    thread sign1_init();
    thread sign1_init_pale_move();
    thread sign1_init_pale_rotate();

    thread sign2_init();
    thread sign2_init_pale_move();
    thread sign2_init_pale_rotate();

    thread camera1_init();
    thread camera1_init_pale_move();
    thread camera1_pale_rotate();

    thread camera2_init();
    thread camera2_init_pale_move();
    thread camera2_pale_rotate();

    thread camera3_init();
    thread camera3_init_pale_move();
    thread camera3_pale_rotate();

    thread drone1_init();
    thread drone1_init_pale_move();
    thread drone1_pale_rotate();

    thread drone2_init();
    thread drone2_init_pale_move();
    thread drone2_pale_rotate();

    thread drone3_init();
    thread drone3_init_pale_move();
    thread drone3_pale_rotate();

    thread drone4_init();
    thread drone4_init_pale_move();
    thread drone4_pale_rotate();

    thread drone5_init();
    thread drone5_init_pale_move();
    thread drone5_pale_rotate();

    thread drone6_init();
    thread drone6_init_pale_move();
    thread drone6_pale_rotate();    
}

sign1_init()
{
    sign = getent ("sign1", "targetname");

    for(;;)
    {
        wait 2;
        sign moveZ(-14,2,1,1);
        wait 2;
        sign moveZ(14,2,1,1);
    }

}

sign1_init_pale_move()
{
    sign_left_pale = getent ("sign1_left_pale", "targetname");
    sign_right_pale = getent ("sign1_right_pale", "targetname"); 

    for(;;)
    {
        wait 2;
        sign_right_pale moveZ(-14,2,1,1);
        sign_left_pale moveZ(-14,2,1,1);
        wait 2;
        sign_right_pale moveZ(14,2,1,1);
        sign_left_pale moveZ(14,2,1,1);
    }

}

sign1_init_pale_rotate()
{
    sign_left_pale = getent ("sign1_left_pale", "targetname");
    sign_right_pale = getent ("sign1_right_pale", "targetname"); 

    for(;;)
    {
        sign_left_pale rotateYaw(-360, 1.3);
        sign_right_pale rotateYaw(360, 1.3);
        wait 1.3;
    }

}

sign2_init()
{
    sign = getent ("sign2", "targetname");

    for(;;)
    {
        wait 2;
        sign moveZ(-14,2,1,1);
        wait 2;
        sign moveZ(14,2,1,1);
    }

}

sign2_init_pale_move()
{
    sign_left_pale = getent ("sign2_left_pale", "targetname");
    sign_right_pale = getent ("sign2_right_pale", "targetname"); 

    for(;;)
    {
        wait 2;
        sign_right_pale moveZ(-14,2,1,1);
        sign_left_pale moveZ(-14,2,1,1);
        wait 2;
        sign_right_pale moveZ(14,2,1,1);
        sign_left_pale moveZ(14,2,1,1);
    }

}

sign2_init_pale_rotate()
{
    sign_left_pale = getent ("sign2_left_pale", "targetname");
    sign_right_pale = getent ("sign2_right_pale", "targetname"); 

    for(;;)
    {
        sign_left_pale rotateYaw(-360, 1.3);
        sign_right_pale rotateYaw(360, 1.3);
        wait 1.3;
    }
}

camera1_init()
{
    camera = getent ("camera1", "targetname");

    for(;;)
    {
        wait 2;
        camera moveZ(-14,2,1,1);
        wait 2;
        camera moveZ(14,2,1,1);
    }
}

camera1_init_pale_move()
{
    camera_pale = getent ("camera1_pale", "targetname"); 

    for(;;)
    {
        wait 2;
        camera_pale moveZ(-14,2,1,1);
        wait 2;
        camera_pale moveZ(14,2,1,1);
    }
}

camera1_pale_rotate()
{
    camera_pale = getent ("camera1_pale", "targetname");

    for(;;)
    {
        camera_pale rotateYaw(-360, 1.3);
        wait 1.3;
    }
}
camera2_init()
{
    camera = getent ("camera2", "targetname");

    for(;;)
    {
        wait 2;
        camera moveZ(-14,2,1,1);
        wait 2;
        camera moveZ(14,2,1,1);
    }
}

camera2_init_pale_move()
{
    camera_pale = getent ("camera2_pale", "targetname"); 

    for(;;)
    {
        wait 2;
        camera_pale moveZ(-14,2,1,1);
        wait 2;
        camera_pale moveZ(14,2,1,1);
    }
}

camera2_pale_rotate()
{
    camera_pale = getent ("camera2_pale", "targetname");

    for(;;)
    {
        camera_pale rotateYaw(-360, 1.3);
        wait 1.3;
    }
}
camera3_init()
{
    camera = getent ("camera3", "targetname");

    for(;;)
    {
        wait 2;
        camera moveZ(-14,2,1,1);
        wait 2;
        camera moveZ(14,2,1,1);
    }
}

camera3_init_pale_move()
{
    camera_pale = getent ("camera3_pale", "targetname"); 

    for(;;)
    {
        wait 2;
        camera_pale moveZ(-14,2,1,1);
        wait 2;
        camera_pale moveZ(14,2,1,1);
    }
}

camera3_pale_rotate()
{
    camera_pale = getent ("camera3_pale", "targetname");

    for(;;)
    {
        camera_pale rotateYaw(-360, 1.3);
        wait 1.3;
    }
}

drone1_init()
{
    drone = getent ("drone1", "targetname");

    for(;;)
    {
        wait 2;
        drone moveZ(-14,2,1,1);
        wait 2;
        drone moveZ(14,2,1,1);
    }
}

drone1_init_pale_move()
{
    drone_pale = getent ("drone1_pale", "targetname"); 

    for(;;)
    {
        wait 2;
        drone_pale moveZ(-14,2,1,1);
        wait 2;
        drone_pale moveZ(14,2,1,1);
    }
}

drone1_pale_rotate()
{
    drone_pale = getent ("drone1_pale", "targetname");

    for(;;)
    {
        drone_pale rotateYaw(-360, 1.3);
        wait 1.3;
    }
}
drone2_init()
{
    drone = getent ("drone2", "targetname");

    for(;;)
    {
        wait 2;
        drone moveZ(-14,2,1,1);
        wait 2;
        drone moveZ(14,2,1,1);
    }
}

drone2_init_pale_move()
{
    drone_pale = getent ("drone2_pale", "targetname"); 

    for(;;)
    {
        wait 2;
        drone_pale moveZ(-14,2,1,1);
        wait 2;
        drone_pale moveZ(14,2,1,1);
    }
}

drone2_pale_rotate()
{
    drone_pale = getent ("drone2_pale", "targetname");

    for(;;)
    {
        drone_pale rotateYaw(-360, 1.3);
        wait 1.3;
    }
}
drone3_init()
{
    drone = getent ("drone3", "targetname");

    for(;;)
    {
        wait 2;
        drone moveZ(-14,2,1,1);
        wait 2;
        drone moveZ(14,2,1,1);
    }
}

drone3_init_pale_move()
{
    drone_pale = getent ("drone3_pale", "targetname"); 

    for(;;)
    {
        wait 2;
        drone_pale moveZ(-14,2,1,1);
        wait 2;
        drone_pale moveZ(14,2,1,1);
    }
}

drone3_pale_rotate()
{
    drone_pale = getent ("drone3_pale", "targetname");

    for(;;)
    {
        drone_pale rotateYaw(-360, 1.3);
        wait 1.3;
    }
}
drone4_init()
{
    drone = getent ("drone4", "targetname");

    for(;;)
    {
        wait 2;
        drone moveZ(-14,2,1,1);
        wait 2;
        drone moveZ(14,2,1,1);
    }
}

drone4_init_pale_move()
{
    drone_pale = getent ("drone4_pale", "targetname"); 

    for(;;)
    {
        wait 2;
        drone_pale moveZ(-14,2,1,1);
        wait 2;
        drone_pale moveZ(14,2,1,1);
    }
}

drone4_pale_rotate()
{
    drone_pale = getent ("drone4_pale", "targetname");

    for(;;)
    {
        drone_pale rotateYaw(-360, 1.3);
        wait 1.3;
    }
}
drone5_init()
{
    drone = getent ("drone5", "targetname");

    for(;;)
    {
        wait 2;
        drone moveZ(-14,2,1,1);
        wait 2;
        drone moveZ(14,2,1,1);
    }
}

drone5_init_pale_move()
{
    drone_pale = getent ("drone5_pale", "targetname"); 

    for(;;)
    {
        wait 2;
        drone_pale moveZ(-14,2,1,1);
        wait 2;
        drone_pale moveZ(14,2,1,1);
    }
}

drone5_pale_rotate()
{
    drone_pale = getent ("drone5_pale", "targetname");

    for(;;)
    {
        drone_pale rotateYaw(-360, 1.3);
        wait 1.3;
    }
}
drone6_init()
{
    drone = getent ("drone6", "targetname");

    for(;;)
    {
        wait 2;
        drone moveZ(-14,2,1,1);
        wait 2;
        drone moveZ(14,2,1,1);
    }
}

drone6_init_pale_move()
{
    drone_pale = getent ("drone6_pale", "targetname"); 

    for(;;)
    {
        wait 2;
        drone_pale moveZ(-14,2,1,1);
        wait 2;
        drone_pale moveZ(14,2,1,1);
    }
}

drone6_pale_rotate()
{
    drone_pale = getent ("drone6_pale", "targetname");

    for(;;)
    {
        drone_pale rotateYaw(-360, 1.3);
        wait 1.3;
    }
}