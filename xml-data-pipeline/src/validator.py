from lxml import etree


class XSDValidator:
    """
    Validates XML files against an XSD schema.
    Acts as a fail-fast ingestion gate in the pipeline.
    """

    def __init__(self, xsd_path: str):
        self.xsd_path = xsd_path
        self.schema = self._load_schema()

    def _load_schema(self) -> etree.XMLSchema:
        with open(self.xsd_path, "rb") as f:
            schema_doc = etree.parse(f)
        return etree.XMLSchema(schema_doc)

    def validate(self, xml_path: str) -> bool:
        with open(xml_path, "rb") as f:
            xml_doc = etree.parse(f)

        if not self.schema.validate(xml_doc):
            raise ValueError(self.schema.error_log)

        return True