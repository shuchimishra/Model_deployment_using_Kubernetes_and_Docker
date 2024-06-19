#Use Gunicorn to make the code multi-threaded
from SAFlask import app

if __name__ == "__main__":
    app.run()
