import os
from lxml import etree


class XSLTTransformer:
    def __init__(self, xslt_path: str):
        with open(xslt_path, "rb") as f:
            xslt_doc = etree.parse(f)
        self.transform = etree.XSLT(xslt_doc)

    def transform_file(self, xml_path: str, output_path: str, params=None):

        # Auto-create output directory
        os.makedirs(os.path.dirname(output_path), exist_ok=True)

        with open(xml_path, "rb") as f:
            xml_doc = etree.parse(f)

        # Convert Python dict → XSLT parameters
        xslt_params = {}
        if params:
            for key, value in params.items():
                xslt_params[key] = etree.XSLT.strparam(value)

        # Apply transformation with parameters (if any)
        result = self.transform(xml_doc, **xslt_params)

        # Save output
        with open(output_path, "wb") as f:
            f.write(etree.tostring(result, pretty_print=True))
