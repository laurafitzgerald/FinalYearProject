run-all:
	make run-m
	make run-s
	make run-a

run-a:
	gnome-terminal --tab --working-directory="/home/laura/fyp/api/src" -e "node index.js"

run-m:
	gnome-terminal --tab -e "sudo mongod"

run-s:
	gnome-terminal \
	--tab --working-directory="/home/laura/fyp/data/service" 		-e "bash -lc 'echo data; node service.js'" \
	--tab --working-directory="/home/laura/fyp/activity/service" 	-e "bash -lc 'echo activity; node service.js'" \
	--tab --working-directory="/home/laura/fyp/authentication" 		-e "bash -lc 'echo authentication; node service.js'" \
	--tab --working-directory="/home/laura/fyp/bike/service" 		-e "bash -lc 'echo bike; node service.js'"  \
	--tab --working-directory="/home/laura/fyp/profile/service" 	-e "bash -lc 'echo profile; node service.js'" \
	--tab --working-directory="/home/laura/fyp/friendship/service" 	-e "bash -lc 'echo friendship; node service.js'" \
	--tab --working-directory="/home/laura/fyp/report/service" 		-e "bash -lc 'echo report; node service.js'"

start-all:
	docker start nats
	docker start cassandra
	docker start data
	docker start activity
	docker start api
	docker start authentication
	docker start bike
	docker start friendship
	docker start profile
	docker start report

stop-services:
	docker stop data
	docker stop activity
	docker stop authentication
	docker stop bike
	docker stop friendship
	docker stop profile
	docker stop report
