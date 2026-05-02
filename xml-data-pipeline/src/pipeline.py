from validator import XSDValidator
from transformer import XSLTTransformer
from json_exporter import JSONExporter
from logger import PipelineLogger
import os


# ===================== PATH SETUP =====================

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA_DIR = os.path.join(BASE_DIR, "data")
XSLT_DIR = os.path.join(BASE_DIR, "xslt")
OUTPUT_DIR = os.path.join(BASE_DIR, "output")

XML_FILE = os.path.join(DATA_DIR, "club.xml")
XSD_FILE = os.path.join(DATA_DIR, "club.xsd")


# ===================== ENSURE OUTPUT FOLDERS =====================

def ensure_dirs():
    os.makedirs(os.path.join(OUTPUT_DIR, "html"), exist_ok=True)
    os.makedirs(os.path.join(OUTPUT_DIR, "json"), exist_ok=True)
    os.makedirs(os.path.join(OUTPUT_DIR, "xml"), exist_ok=True)


# ===================== MAIN PIPELINE =====================

def main():

    logger = PipelineLogger()

    try:
        logger.info("Pipeline started")

        ensure_dirs()

        # ---------- STEP 1: VALIDATION ----------
        validator = XSDValidator(XSD_FILE)
        valid = validator.validate(XML_FILE)

        if not valid:
            raise Exception("XML validation failed")

        logger.info("Validation successful")

        # ---------- STEP 2: HTML SCENARIOS ----------
        html_scenarios = [
            ("scenario1.xsl", "members.html"),
            ("scenario2_coaches.xsl", "coaches.html"),
            ("scenario3_teams.xsl", "teams.html"),
            ("scenario4_sessions.xsl", "sessions.html"),
            ("scenario5_facilities.xsl", "facilities.html"),
            ("scenario6_bookings.xsl", "bookings.html"),
            ("scenario7_dashboard.xsl", "dashboard.html"),
        ]

        for xslt_name, output_name in html_scenarios:
            xslt_file = os.path.join(XSLT_DIR, xslt_name)
            output_file = os.path.join(OUTPUT_DIR, "html", output_name)

            if not os.path.exists(xslt_file):
                logger.error(f"Missing XSLT file: {xslt_file}")
                continue

            transformer = XSLTTransformer(xslt_file)
            transformer.transform_file(XML_FILE, output_file)

            logger.info(f"Generated HTML: {output_file}")

        # ---------- STEP 3: XML SCENARIOS ----------
        xml_scenarios = [
            # Add XML-only scenarios here if needed
        ]

        for xslt_name, output_name in xml_scenarios:
            xslt_file = os.path.join(XSLT_DIR, xslt_name)
            output_file = os.path.join(OUTPUT_DIR, "xml", output_name)

            if not os.path.exists(xslt_file):
                logger.error(f"Missing XSLT file: {xslt_file}")
                continue

            transformer = XSLTTransformer(xslt_file)
            transformer.transform_file(XML_FILE, output_file)

            logger.info(f"Generated XML: {output_file}")

        # ---------- STEP 4: JSON SCENARIOS ----------
        json_exporter = JSONExporter()

        json_scenarios = [
            os.path.join(OUTPUT_DIR, "json", "members.json"),
            os.path.join(OUTPUT_DIR, "json", "bookings.json"),
        ]

        for output_file in json_scenarios:
            json_exporter.xml_to_json(XML_FILE, output_file)
            logger.info(f"Generated JSON: {output_file}")

        # ============================================================
        # STEP 5: USER STORY TRANSFORMATIONS (NEW)
        # ============================================================

        # ---------- USER STORY 1: Sessions by Coach ----------
        try:
            xslt_file = os.path.join(XSLT_DIR, "sessions_by_coach.xsl")
            output_file = os.path.join(OUTPUT_DIR, "xml", "sessions_by_coach.xml")

            if os.path.exists(xslt_file):
                transformer = XSLTTransformer(xslt_file)
                transformer.transform_file(XML_FILE, output_file, params={"coachId": "C002"})
                logger.info(f"Generated User Story 1 XML: {output_file}")
            else:
                logger.error("Missing XSLT: sessions_by_coach.xsl")

        except Exception as e:
            logger.error(f"User Story 1 failed: {e}")

        # ---------- USER STORY 2: Free Facilities by Date ----------
        try:
            xslt_file = os.path.join(XSLT_DIR, "free_facilities.xsl")
            output_file = os.path.join(OUTPUT_DIR, "xml", "free_facilities.xml")

            if os.path.exists(xslt_file):
                transformer = XSLTTransformer(xslt_file)
                transformer.transform_file(XML_FILE, output_file, params={"date": "2026-05-03"})
                logger.info(f"Generated User Story 2 XML: {output_file}")
            else:
                logger.error("Missing XSLT: free_facilities.xsl")

        except Exception as e:
            logger.error(f"User Story 2 failed: {e}")

        # ============================================================

        logger.info("Pipeline completed successfully")

    except Exception as e:
        logger.error(f"Pipeline failed: {e}")


if __name__ == "__main__":
    main()
