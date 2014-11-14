from flask import Flask, render_template, redirect, request
import numpy as np
from matplotlib import pyplot as plt

app = Flask("Softwar Carpentry")

@app.route('/')
def index():
    return redirect('form?value=1.')

@app.route('/form')
def form():
    value = request.args.get('value', 2.0)
    return render_template('form.html', value=float(value))


@app.route('/fig/<value>')
def pow_fig(value):
    value = float(value)
    fig,ax = plt.subplots()
    ax.plot(np.arange(10)**value)
    ax.set_xlabel('x')
    ax.set_ylabel('pow(x,{})'.format(value))
    fig.savefig('tmp.png')
    data = open('tmp.png', 'rb')
    return data.read()
    
app.run(debug=True)
