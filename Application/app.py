from flask import Flask, url_for,render_template



app = Flask(__name__)

@app.route('/')
def home():
    return render_template("index.html", title="Shubham Thorat")

@app.route('/about')
def about():
    return render_template("about.html", title="Shubham Thorat")

@app.route('/contact')
def contact():
    return render_template("contact.html", title="Shubham Thorat")




if __name__ == '__main__':
    app.run(port=8000, host="0.0.0.0")
