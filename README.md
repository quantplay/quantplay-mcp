# QuantPlay MCP Server

An MCP (Model Context Protocol) server for the QuantPlay trading API, providing access to account data, positions, and holdings through AI assistants.

## Features

- **Account Management**: Retrieve all broker accounts
- **Position Tracking**: Get positions by account nickname
- **Holdings Analysis**: Access holdings data by account nickname
- **MCP Integration**: Works with Claude Desktop and other MCP-compatible clients

## Installation

Install from PyPI:

```bash
pip install quantplay-mcp
```

Or install from source:

```bash
git clone https://github.com/your-username/quantplay-mcp.git
cd quantplay-mcp
pip install -e .
```

## Setup

### 1. Get Your QuantPlay API Key

1. Visit [QuantPlay](https://quantplay.com) and sign up for an account
2. Navigate to your API settings to generate an API key
3. Copy your API key for the next step

### 2. Environment Configuration

Create a `.env` file in your project directory:

```bash
QUANTPLAY_API_KEY=your_api_key_here
```

### 3. MCP Client Configuration

#### For Claude Desktop

Add to your Claude Desktop configuration file:

**macOS**: `~/Library/Application Support/Claude/claude_desktop_config.json`
**Windows**: `%APPDATA%/Claude/claude_desktop_config.json`

```json
{
  "mcpServers": {
    "Quantplay": {
      "command": "python",
      "args": [
        "-m",
        "quantplay_mcp"
      ],
      "env": {
        "QUANTPLAY_API_KEY": "your_api_key_here"
      }
    }
  }
}
```

**Example with conda/miniconda:**

```json
{
  "mcpServers": {
    "Quantplay": {
      "command": "/Users/YOUR_USERNAME/miniconda3/bin/python",
      "args": [
        "/Users/YOUR_USERNAME/miniconda3/lib/python3.12/site-packages/quantplay_mcp/server.py"
      ],
      "env": {
        "QUANTPLAY_API_KEY": "your_api_key_here"
      }
    }
  }
}
```

#### For Other MCP Clients

Run the server directly:

```bash
quantplay-mcp
```

Or use Python module execution:

```bash
python -m quantplay_mcp
```

## Available Tools

The MCP server provides three tools:

### `get_accounts()`

- **Description**: Get all broker accounts for the user
- **Parameters**: None
- **Returns**: List of account dictionaries with account details

### `get_positions(nickname: str)`

- **Description**: Get positions for a specific account
- **Parameters**:
  - `nickname`: The account nickname to query
- **Returns**: List of position dictionaries

### `get_holdings(nickname: str)`

- **Description**: Get holdings for a specific account
- **Parameters**:
  - `nickname`: The account nickname to query
- **Returns**: List of holdings dictionaries

## Usage Examples

Once configured, you can use these tools through your MCP client:

```
# Get all accounts
"Show me all my trading accounts"

# Get positions for a specific account
"What are my positions in my main account?"

# Get holdings for a specific account
"Show me the holdings in my retirement account"
```

## Development

### Requirements

- Python 3.11+
- QuantPlay API key

### Local Development

1. Clone the repository
2. Install dependencies: `pip install -r requirements.txt`
3. Set up your `.env` file with your API key
4. Run the server: `python -m quantplay_mcp`

## Version

Current version: 0.1.21

## Support

For issues and questions:

- Check the [Issues](https://github.com/quantplay/quantplay-mcp/issues) page
- Visit [QuantPlay Documentation](https://docs.quantplay.tech) for API details
