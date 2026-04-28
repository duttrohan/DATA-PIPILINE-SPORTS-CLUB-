import logging
import os


class PipelineLogger:
    def __init__(self, log_file="output/logs/pipeline.log"):

        os.makedirs(os.path.dirname(log_file), exist_ok=True)

        logging.basicConfig(
            filename=log_file,
            level=logging.INFO,
            format="%(asctime)s - %(levelname)s - %(message)s"
        )

        self.logger = logging.getLogger()

    def info(self, message: str):
        self.logger.info(message)
        print(message)

    def error(self, message: str):
        self.logger.error(message)
        print("ERROR:", message)