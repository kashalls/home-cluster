#!/bin/bash

OUTPUT_DIR="/home/runner/.datree/crdSchemas"
INDEX_FILE="$OUTPUT_DIR/index.html"

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

for file in "$OUTPUT_DIR"/*; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file")
        echo "        <li><a href=\"$filename\">$filename</a></li>" >> "$INDEX_FILE"
    fi
done

cat >> "$INDEX_FILE" <<EOF
    </ul>
</body>
</html>
EOF

echo "Generated index.html in $OUTPUT_DIR"
