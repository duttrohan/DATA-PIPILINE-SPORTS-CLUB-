from validator import XSDValidator
from transformer import XSLTTransformer
from json_exporter import JSONExporter
from logger import PipelineLogger
import os


def ensure_dirs():
    os.makedirs("output/html", exist_ok=True)
    os.makedirs("output/json", exist_ok=True)
    os.makedirs("output/xml", exist_ok=True)


def main():

    logger = PipelineLogger()

    xml_file = "data/club.xml"
    xsd_file = "data/club.xsd"

    try:
        logger.info("Pipeline started")

        # Ensure output folders exist
        ensure_dirs()

        # ================= STEP 1: VALIDATION =================
        validator = XSDValidator(xsd_file)
        valid = validator.validate(xml_file)

        if not valid:
            raise Exception("XML validation failed")

        logger.info("Validation successful")

        # ================= STEP 2: HTML SCENARIOS =================
        html_scenarios = [
            ("xslt/scenario1.xsl", "output/html/members.html"),
            ("xslt/scenario2_coaches.xsl", "output/html/coaches.html"),
            ("xslt/scenario3_teams.xsl", "output/html/teams.html"),
            ("xslt/scenario4_sessions.xsl", "output/html/sessions.html"),
            ("xslt/scenario5_facilities.xsl", "output/html/facilities.html"),
            ("xslt/scenario6_bookings.xsl", "output/html/bookings.html"),
            ("xslt/scenario7_dashboard.xsl", "output/html/dashboard.html"),
        ]

        for xslt_file, output_file in html_scenarios:

            if not os.path.exists(xslt_file):
                logger.error(f"Missing XSLT file: {xslt_file}")
                continue

            transformer = XSLTTransformer(xslt_file)
            transformer.transform_file(xml_file, output_file)

            logger.info(f"Generated HTML: {output_file}")

        # ================= STEP 3: XML SCENARIOS =================
        xml_scenarios = [
            # ("xslt/scenario7_teams_xml.xsl", "output/xml/teams.xml"),
            # ("xslt/scenario8_sessions_xml.xsl", "output/xml/sessions.xml"),
        ]

        for xslt_file, output_file in xml_scenarios:

            if not os.path.exists(xslt_file):
                logger.error(f"Missing XSLT file: {xslt_file}")
                continue

            transformer = XSLTTransformer(xslt_file)
            transformer.transform_file(xml_file, output_file)

            logger.info(f"Generated XML: {output_file}")

        # ================= STEP 4: JSON SCENARIOS =================
        json_exporter = JSONExporter()

        json_scenarios = [
            "output/json/members.json",
            "output/json/bookings.json",
        ]

        for output_file in json_scenarios:
            json_exporter.xml_to_json(xml_file, output_file)
            logger.info(f"Generated JSON: {output_file}")

        logger.info("Pipeline completed successfully")

    except Exception as e:
        logger.error(f"Pipeline failed: {e}")


if __name__ == "__main__":
    main()