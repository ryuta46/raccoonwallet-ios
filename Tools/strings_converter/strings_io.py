import re
import xml.etree.ElementTree as ElementTree
from typing import Dict, List

IOS_STRING_PATTERN = r'"(.*)" *= *"(.*)" *;'


def read_ios_strings(file_name: str) -> Dict[str, str]:
    string_key_values: Dict[str, str] = {}
    with open(file_name) as f:
        for line in f:
            line = line.rstrip()
            if len(line) == 0:
                continue

            result = re.match(IOS_STRING_PATTERN, line)

            if result:
                # print(f'key  : {result.group(1)}')
                # print(f'value: {result.group(2)}')
                key = result.group(1)
                value = result.group(2)
                string_key_values[key] = value

            else:
                print(line)

    return string_key_values


def read_android_strings(file_name: str) -> Dict[str, str]:
    string_key_values: Dict[str, str] = {}
    with open(file_name) as f:
        root = ElementTree.fromstring(f.read())

        for tag in root.iter('string'):
            # print(tag.attrib["name"])
            # print(tag.text)
            if tag.text:
                string_key_values[tag.attrib["name"]] = tag.text
            else:
                string_key_values[tag.attrib["name"]] = tag[0].text

    return string_key_values


def write_ios_strings(file_name: str, string_key_values: Dict[str, str]):
    with open(file_name, 'w') as f:
        sorted_keys = sorted(string_key_values.keys())
        for key in sorted_keys:
            f.write(f"\"{key}\" = \"{string_key_values[key]}\";\n")


def convert_ios_strings(src_file_name: str, dst_file_name: str, android_file_name: str, key_map: Dict[str, str]):
    android_key_values = read_android_strings(android_file_name)

    with open(src_file_name) as src:
        with open(dst_file_name, 'w') as dst:
            for line in src:
                stripped_line = line.rstrip()
                if len(stripped_line) == 0:
                    dst.write(line)
                    continue

                result = re.match(IOS_STRING_PATTERN, line)

                if not result:
                    dst.write(line)
                    continue

                key = result.group(1)

                if key not in key_map:
                    dst.write(line)
                    continue

                android_key = key_map[key]
                if android_key not in android_key_values:
                    print(f"Key is not in Android file!! : {android_key}")
                    dst.write(line)
                    continue

                android_value = android_key_values[android_key]
                dst.write(f"\"{key}\" = \"{android_value}\";\n")
