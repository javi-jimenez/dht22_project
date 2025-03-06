from fastapi import FastAPI
from fastapi.responses import StreamingResponse, PlainTextResponse, JSONResponse
from .sensor import read_sensor
import asyncio

app = FastAPI()

async def sensor_stream(format_type):
    while True:
        data = read_sensor()
        if format_type == 'json':
            yield f"{JSONResponse(content=data)}\n"
        elif format_type == 'plain':
            yield f"Temp: {data['temperature']}C, Humidity: {data['humidity']}%\n"
        await asyncio.sleep(2)

@app.get("/stream/json")
def stream_json():
    return StreamingResponse(sensor_stream('json'), media_type="application/json")

@app.get("/stream/plain")
def stream_plain():
    return StreamingResponse(sensor_stream('plain'), media_type="text/plain")

@app.get("/health")
def health_check():
    return {"status": "ok", "message": "Service is running"}
