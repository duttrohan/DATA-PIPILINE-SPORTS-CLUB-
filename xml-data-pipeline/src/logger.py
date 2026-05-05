import logging
import os


class PipelineLogger:
    def __init__(self, log_file="output/logs/pipeline.log"):

        base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        log_path = os.path.join(base_dir, "output", "logs", "pipeline.log")

        os.makedirs(os.path.dirname(log_path), exist_ok=True)

        logging.basicConfig(
            filename=log_path,
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