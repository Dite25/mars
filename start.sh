set -e

export PYTHONUNBUFFERED=true

VIRTUALENV=".data/xenx"

if [ -d "$VIRTUALENV" ]; then
    python3 -m venv "$VIRTUALENV"
fi

if [ ! -f "$VIRTUALENV/bin/pip" ]; then
    curl -sS -L -o get-pip.py https://bootstrap.pypa.io/get-pip.py
    $VIRTUALENV/bin/python get-pip.py
fi

$VIRTUALENV/bin/pip install -r requirements.txt

$VIRTUALENV/bin/python3 app.py
Footer