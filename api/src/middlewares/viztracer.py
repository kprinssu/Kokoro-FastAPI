import viztracer

class ViztracerMiddleware:
    endpoints = ["/v1/audio/speech"]

    def __init__(self, app):
        self.app = app

    async def __call__(self, scope, receive, send):
        if (scope["path"] in self.endpoints):
            with viztracer.VizTracer(log_torch=True, log_async=True, output_file="/tmp/result.json"):
                return await self.app(scope, receive, send)

        return await self.app(scope, receive, send)
