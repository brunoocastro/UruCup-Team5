# Team 5 - Competitors of UruCup 1º Edition

Repository of Team 5 to UruCup Competition.

Members:

* William Moraes - UTEC
* Adir Junior Junior - FURG
* Bruno Silva de Castro - UFSM
* Nathalie Silvina Rodriguez Rojas - ORT
* Anthony Scirgalea - UTEC
* Emilly Lamotte - FURG
* Agustina de Freitas - UTEC
* Marina Zanotta Rocha - FURG
* Kristofer Kappel - UFPEL
* Murilo Castanheira Bicho - FURG
* Joshua Pedroso - FURG



# Requirements

You needs the `Docker` installed correctly

And need another packages:

    -`make`


# RUN Simulation:

Follow step-by-step to run totally the simulation

1. grant permissions:	`make perms`
2. up our container:   	`make up`
3. open another terminal and take the container id by the command:	`docker ps`
4. access your container at terminal (pass your container id):	`make access <container_id>`
5. source ros environment:	`source devel/setup.bash`
6. run the main package: 	`roslaunch grsim_ros_bridge launch.launch`

Now the simulation in running. You can interact with them right now!


# See simulator topics

*OBS: Simulator needs to be visible in your screen to publish in the vision topic*


Let see the simulator feedback from robots position:

1. Pick the container ID using:	`docker ps`
2. Open a new terminal and access the container using:	`make access <container_id>`
3. Hear the topic to see their updates:	`rostopic echo /vision`


# Control manually a single robot

To test if the simulation in running correctly, you can move a single robot by publishing directly in their topic.

In this case, we will use the blue robot with id 0:

1. Pick the container ID using:	`docker ps`
2. Open a new terminal and access the container using:	`make access <container_id>`
3. Publish in the robot topic a new message, changing their X axis velocity to 0.5:

   ```bash
   rostopic pub /robot_blue_0/cmd grsim_ros_bridge_msgs/SSL "cmd_vel:
     linear:
       x: 0.5 
       y: 0.0
       z: 0.0
     angular:
       x: 0.0
       y: 0.0
       z: 0.0
   kicker: false
   dribbler: false"
   ```
4. Now you can see in the simulator if the robot blue with id 0 is running away
5. BTW, now you can do any tests
