# -*- coding: utf-8 -*-
"""Untitled18.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1csLcxsfOO7KT5oCyB8vd1jJ6HsqO8CP3
"""

# from google.colab import drive
# drive.mount('/content/drive')
# !cp -r "/content/drive/MyDrive/Data Science & Machine Learning/MLOps/Repository/model_output" "/content"
# !ls "/content/model_output"

# import socket
# print(socket.gethostbyname(socket.gethostname()))

import tensorflow_datasets as tfds
import tensorflow as tf
from flask import Flask, jsonify, make_response, request

app = Flask(__name__)
padding_size = 1000
model = tf.keras.models.load_model('/Users/shuchimishra/Library/CloudStorage/GoogleDrive-shuchimishra@g.ucla.edu/My Drive/Data Science & Machine Learning/MLOps/Repository/model_output/sentiment_analysis.hdf5')
text_encoder = tfds.deprecated.text.TokenTextEncoder.load_from_file("/Users/shuchimishra/Library/CloudStorage/GoogleDrive-shuchimishra@g.ucla.edu/My Drive/Data Science & Machine Learning/MLOps/Repository/model_output/sa_encoder.vocab")

print('Model and Vocabulory loaded.......')


def pad_to_size(vec, size):
    zeros = [0] * (size - len(vec))
    vec.extend(zeros)
    return vec


def predict_fn(predict_text, pad_size):
    encoded_text = text_encoder.encode(predict_text)
    encoded_text = pad_to_size(encoded_text, pad_size)
    encoded_text = tf.cast(encoded_text, tf.int64)
    predictions = model.predict(tf.expand_dims(encoded_text, 0))

    return (predictions.tolist())


@app.route('/seclassifier', methods=['POST'])
def predict_sentiment():
    text = request.get_json()['text']
    print(text)
    predictions = predict_fn(text, padding_size)
    sentiment = 'positive' if float(''.join(map(str,predictions[0]))) > 0 else 'Negative'
    return jsonify({'predictions ':predictions, 'sentiment ': sentiment})


if __name__ == "__main__":
    app.run(host='0.0.0.0', port='5000')