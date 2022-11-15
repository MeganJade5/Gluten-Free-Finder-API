# Gluten Free Finder application
## Megan Van Der Weide & Sofia-Bella Frugone

--- 
💎 Deployed App: 

🛠 Staging Environment App: 

🖥 Client Repo: 

🖥 Server Repo: 

📖 Part A Documentation Repo: https://github.com/MeganJade5/Gluten-Free-Finder-Docs

Gluten Free Finder is a website for the general public to locate a credible gluten-free restaurant. It removes the trial and error and suffering from eating something with Gluten. This web application is a service connecting restaurants and customers. It showcases and advertises that the restaurants care about their customers, take allergies seriously and provide safe food choices.  The application has been built with the Rails and React stack and deployed with Netlify and Heroku.

---
### Installation Instructions
To use the production app, please visit **deployed app** and create an account. To use the app locally, please follow the below instructions.

**Requirements:**
- Ruby 3.1.0
- Rails 7.0.4
- Postgresql

**Gluten-Free-Finder-API**

Installing Ruby:

- Ensure Ruby is installed by entering the following command in Terminal: ruby —version
- If a valid Ruby version is not returned, refer to the following link to install Ruby for your operating system: https://www.ruby-lang.org/en/downloads/

Installing PostgreSQL:

- Ensure PostgreSQL is installed by entering the following command in Terminal: psql —version
- If a valid version of PostgreSQL is not returned, refer to the link below to install PostgreSQL for your operating system: https://www.postgresql.org/download/
Downloading the Application: Navigate to the GitHub repository as linked above; and Either clone or download ZIP of the application.

Installing Gems:

- Ensure you have Bundler installed by opening Terminal and entering the following command: bundler —version
- If Bundler is not installed and an error is returned, enter the following command to install: gem install bundler Navigate to the root directory of the application and install the required gems with: bundle install
  
Running the Application on your localhost:

Clone the app: 
- Create a directory on your machine named `Gluten-Free-Finder` and `$ cd` into it.
- Whilst in the directory, clone the repo `git clone https://github.com/MeganJade5/Gluten-Free-Finder-API.git`
- `$ cd` into the folder `Gluten-Free-Finder-API`
- install packages above
- Ensure postgresql is running
- Create local database `rails db:create`
- Seed the local database `rails db:seed` to view dummy data in local application
- Ensure you are in the application's root directory and enter the following command to run the application within your browser: `rails s`
- The server will run on local host port 3000

**Gluten-Free-Finder-FrontEnd**

To view as admin:

The seed data file created an admin account for you with the following credentials to login: 
email: admin@glutenfreefinder.com
password: admin123

---

### Tech Stack 
**Front-end:** HTML, CSS, JavaScript, React, JSX, Style Framework TBD (Bootstrap, Tailwind or Material UI)

**Back-end:** Rails

**Database:** Postgresql

**Deployment:** Heroku & Netlify

**Testing:** 

**Project management:** Trello, Discord

**Design:** Figma, Canva, Draw.io

**DevOps:** Git, Github, VS code

---

## API Endpoints

---

## Testing

---

## Libraries & Dependencies:

---

## Screenshots:

---

## Project Management
The project managment tool we've used to track our progress for this assesment is [Trello, which can be viewed here.](https://trello.com/b/g94algv7/t3a2-full-stack-app) We have 10 columns in our board, each of which contribute to an agile approach of product development.

1. **Blocked** Tasks which we are unable to continue with without further follow up. 
2. **Extras** Our nice-to-haves if time allows. 
3. **Need to discuss** Tasks which require more discussion.
4. **Coming Up** Tasks we will complete next sprint but need to look into before the sprint begins.
5. **To-do** Current sprint tasks.
6. **In progress** Tasks being worked on.
7. **Testing** Any tasks going through manual/user testing before being completed. 
8. **Done** Finished tasks!
9. **Questions** Similar to our discuss column however we added this board to help us visually.
10. **Resources** Any resources we want to keep during our development process. For quick reference.

 ![Trello-Board-1](./img/trello-1.png)

 ![Trello-Board-2](./img/trello-2.png)
 

--- 
## Reflection 