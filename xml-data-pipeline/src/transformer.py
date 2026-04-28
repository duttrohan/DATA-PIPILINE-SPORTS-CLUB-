import os
from lxml import etree


class XSLTTransformer:
    def __init__(self, xslt_path: str):
        with open(xslt_path, "rb") as f:
            xslt_doc = etree.parse(f)
        self.transform = etree.XSLT(xslt_doc)

    def transform_file(self, xml_path: str, output_path: str):

        # 🔥 AUTO-CREATE OUTPUT DIRECTORY
        os.makedirs(os.path.dirname(output_path), exist_ok=True)

        with open(xml_path, "rb") as f:
            xml_doc = etree.parse(f)

        result = self.transform(xml_doc)

        with open(output_path, "wb") as f:
            f.write(str(result).encode("utf-8"))