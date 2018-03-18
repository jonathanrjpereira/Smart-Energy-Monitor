import dash
import dash_core_components as dcc
import dash_html_components as html
import plotly.plotly as py
from plotly.graph_objs import *


app = dash.Dash()

app.layout = html.Div(children=[
    dcc.Graph(
        id='example-graph',
        figure={
            'data': [
                {
                'labels':['Electronics','Computers','Production','IT'],
                'values':[50,100,80,40],
                'type':'pie',
                'name': 'Crescendo',
                'marker':{
                            'colors': [
                                        'rgb(244, 67, 54)',
                                        'rgb(76, 175, 80)',
                                        'rgb(13, 71, 161)',
                                        'rgb(253, 216, 53)',
                                        ]
                            },
                'domain': { 'x': [0, 5],
                            'y': [0, 5]
                            },
                'hoverinfo':'label+percent+name',
                'textinfo':'none'
                }
            ],
            'layout': {
                'title': 'Dash Data Visualization'
            }
        }
    )
])

if __name__ == '__main__':
    app.run_server(debug=True)
