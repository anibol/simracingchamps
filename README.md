# simracingchamps

![alt text](https://github.com/anibol/simracingchamps/blob/master/IRT/Content/img/web/SimRacingChamps2.png?raw=true)

A web application for managing sim racing championships developed in ASP.NET + SQL Server

- Visual Studio v2019
- SQL Server 2019 v15.0.2000

List of code changes required for proper operation:

- In the registration forms (manager & driver) the code to use reCaptcha is commented, you have to register and obtain a key for the destination domain and uncomment the code
- You have to set in the project configuration the data of the mail account and SMTP server
- The empty database is at "IRT\basedatos" folder. Change the connection string to suit your setup.
- There is an "admin" user that have special powers regarding the management of the championships added by managers. When a manager publish a championship it isn't visible at the website until the admin validates it.
- Admin user: admin@simracingchamps.com / 12345678
- Demo users: 
	- Manager: organizador@simracingchamps.com / 12345678
	- Driver: piloto@simracingchamps.com / 12345678

