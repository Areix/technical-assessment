import yfinance as yf
import flask.json
from flask import Flask, request, jsonify,redirect,url_for
from flask_cors import CORS

import boto3
from boto3.dynamodb.conditions import Key, Attr
from botocore.exceptions import ClientError
from flasgger import Swagger
from flasgger import swag_from


app = Flask(__name__)
swagger = Swagger(app)


client = boto3.resource('dynamodb',region_name='us-east-1')

CORS(app)

# Helper class to convert a DynamoDB item to JSON.
class DecimalEncoder(flask.json.JSONEncoder):
    def default(self, o):
        if isinstance(o, decimal.Decimal):
            if o % 1 > 0:
                return float(o)
            else:
                return int(o)
        return super(DecimalEncoder, self).default(o)

app.json_encoder = DecimalEncoder

@app.route('/')
def hello_world():
    return 'Hello, World!'

@swag_from('./apidocs/stock.yml')
@app.route('/stock/<symbol>', methods=["GET"])
def get_stock(symbol):
    """
    get the stock
    """
    if not symbol:
        return {"error": True, "success": False, "data": None, 'msg': 'please specify the symbol'}
    
    ### URL params
    page = request.args.get("page")
    print(page)

    ### The logic and database CRUD operations are performed in here

    try:
        res = {}
        yahoo_data = yf.Ticker(symbol)

        res['ma200'] = yahoo_data.info['twoHundredDayAverage']
        res['ma50'] = yahoo_data.info['fiftyDayAverage']
        res['price'] = yahoo_data.info['previousClose']
        res['forward_pe'] = yahoo_data.info['forwardPE']
        res['forward_eps'] = yahoo_data.info['forwardEps']
        if yahoo_data.info['dividendYield'] is not None:
            res['dividend_yield'] = yahoo_data.info['dividendYield'] * 100

        return {'error':False,'success':True,'data':res, 'msg':'return stock data'}
    
    except Exception as e:
        # traceback.print_exc()
        return {'error':True,'success':False,'data':None, 'msg':e.__str__()}

if __name__ == '__main__':
    app.config['JSONIFY_PRETTYPRINT_REGULAR'] = True
    app.run(host='0.0.0.0')

