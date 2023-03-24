# UruCup-Team5

# RUN Simulation:

[Install REMMINA](https://remmina.org/how-to-install-remmina "https://remmina.org/how-to-install-remmina") clicking here

Run remmina typping "remmina" at terminal

Build docker image entering this folder and runnning:

```bash
docker build -t urucup .
```

Run docker image:

```bash
docker run --net=host -eVNC_PASSWORD=vnc -eVNC_GEOMETRY=1920x1080 urucup vnc
```

Connect in Remmina by VNC, using `localhost:5900` and password is `vnc`

Now you have the simulation running, just enter a new terminal and access the docker image terminal using:

```bash
docker exec -it magical_zhukovsky /bin/bash
```

Now you can run your scripts to command the simulation.
