# Backend
## Technical Requirements
- [Python 3](https://www.python.org/  "Python 3") 
- [Django Framework](https://www.djangoproject.com/  "Django Framework")
- [Django Rest Framework](https://www.django-rest-framework.org/  "Django Rest Framework")

## Architecture
The backend contains api and db

### db
db contains a sqlite3 database prepopulated with some dummy data.

### api

The api contains three django apps - base, products_api, and sellers_api.

#### base
This contains all the configurations required for the django project to run.

#### products_api
A rest api built using Django Rest Framwork allows GET, POST, PUT and DELETE requests with endpoints at: 
- `http://<host>/sellers/` responds with all sellers from the database.
- `http://<host>/sellers/?id={id_of_the_seller}` responds with specific seller from the database.
- `http://<host>/sellers/?city=all` responds with all cities from the database.
- `http://<host>/sellers/?address={city_name}` responds with all addresses from a specific city retrieved from the database.

#### sellers_api
A rest api built using Django Rest Framwork allows GET, POST, PUT and DELETE requests with endpoints at: 
- `http://<host>/sellers/` responds with all sellers from the database.
- `http://<host>/sellers/?id={id_of_the_seller}` responds with specific seller from the database.
- `http://<host>/sellers/?city=all` responds with all cities from the database.
- `http://<host>/sellers/?address={city_name}` responds with all addresses from a specific city retrieved from the database.

## Start
You need to have latest version of Python 3 installed in your Operating System. Ensure environment variables point to the Python 3 installation( for Windows OS).
### Virtual Environment (Optional)
Navigate to the folder plp/backend in the Terminal and run
`python -m venv .venv`

Then activate the virtual environment

### Install Packages
Navigate to the folder **plp/backend/** in the Terminal  
To install required packages run `pip install -r requirements.txt`

### Start server
Navigate to the folder plp/backend/api in the Terminal and run `python manage.py runserver YOUR_IP_ADDRESS:PORT_NUMBER`

#### Networking Caveat
Use your ip address to enable the frontend app to fetch data from the api when using an emulator or physical device. The emulator/physical device should be in the same network as the computer running the server. Example connected to the same wifi.

I noticed that localhost doesn&#39;t work for external devices/emulators.

This should be the output on the terminal: 
With 127.0.0.1 being your IP_ADDRESS

![Terminal](https://user-images.githubusercontent.com/39475602/193451089-4749a71b-cf47-4e6e-99b8-24b67aae9f73.png)

## Great! The backend is now ready to start receiving REST requests.








