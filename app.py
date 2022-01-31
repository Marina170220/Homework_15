from flask import Flask, jsonify
from utils import *
app = Flask(__name__)


@app.route('/<int:itemid>')
def page_animal(itemid):
    animal_data = get_animal_by_id(itemid, 'animal.db', 'animals_new')
    return jsonify(animal_data)


if __name__ == '__main__':
    app.run(debug=True)