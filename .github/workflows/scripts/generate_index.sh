#!/bin/bash

OUTPUT_DIR="/home/runner/.datree/crdSchemas"
INDEX_FILE="$OUTPUT_DIR/index.html"

if [[ ! -d "$OUTPUT_DIR" ]] || [[ -z "$(find "$OUTPUT_DIR" -type f -name "*.json")" ]]; then
    echo "No JSON files found in $OUTPUT_DIR"
    exit 1
fi

cat > "$INDEX_FILE" <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kubernetes CRD Schemas</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { color: #333; }
        ul { list-style-type: none; padding: 0; }
        li { margin: 5px 0; }
        a { text-decoration: none; color: #007bff; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1>Available Kubernetes CRD Schemas</h1>
    <ul>
EOF

echo "Found JSON files:"
find "$OUTPUT_DIR" -type f -name "*.json"

while IFS= read -r file; do
    [[ -z "$file" ]] && continue

    relative_path="${file#"$OUTPUT_DIR"/}"

    echo "Adding to index: $relative_path"
    echo "        <li><a href=\"$relative_path\">$relative_path</a></li>" >> "$INDEX_FILE"
done < <(find "$OUTPUT_DIR" -type f -name "*.json" | sort)

cat >> "$INDEX_FILE" <<EOF
    </ul>
</body>
</html>
EOF

echo "Generated index.html in $OUTPUT_DIR"
