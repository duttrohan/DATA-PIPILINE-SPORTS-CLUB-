import json
from lxml import etree
import os


class JSONExporter:
    def __init__(self):
        pass

    def xml_to_json(self, xml_path: str, output_path: str):

        os.makedirs(os.path.dirname(output_path), exist_ok=True)

        tree = etree.parse(xml_path)
        root = tree.getroot()

        data = {
            "club": {
                "members": []
            }
        }

        for member in root.xpath("//member"):
            data["club"]["members"].append({
                "id": member.get("id"),
                "name": member.findtext("name")
            })

        with open(output_path, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=4)

        return True