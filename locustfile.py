from locust import HttpUser, TaskSet, task, between

class UserBehavior(TaskSet):
    @task(1)
    def view_buses(self):
        self.client.get("/view_buses")

    @task(2)
    def buy_ticket(self):
        self.client.post("/buy_ticket/1", {
            "customer_name": "admin",
            "seats_reserved": 1,
            "plan": "one-time"
        })

    @task(3)
    def view_tickets(self):
        self.client.get("/my_tickets")

    @task(4)
    def login(self):
        self.client.post("/login", {
            "username": "admin",
            "password": "admin"
        })

    @task(5)
    def logout(self):
        self.client.get("/logout")

class WebsiteUser(HttpUser):
    tasks = [UserBehavior]
    wait_time = between(1, 5)