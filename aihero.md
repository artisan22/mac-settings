# Showing Context in the Status Line

Claude Code doesn't show your [context window](https://www.aihero.dev/ai-coding-dictionary/context-window) usage by default. You need to set this up yourself if you want to monitor it constantly while you're coding.

Having that number right in your status line, visible at a glance, gives you the feedback you need to make good decisions about your [session](https://www.aihero.dev/ai-coding-dictionary/session). We'll use [`ccstatusline`](https://www.npmjs.com/package/ccstatusline), a community tool that formats Claude Code's session data into a clean status line.

## Steps To Complete

### Configure ccstatusline

- [ ] Create the config directory

```bash
mkdir -p ~/.config/ccstatusline
```

- [ ] Create `~/.config/ccstatusline/settings.json` with this content:

```json
{
  "version": 3,
  "lines": [
    [
      {
        "id": "1",
        "type": "context-length",
        "color": "yellow",
        "bold": true,
        "rawValue": true
      },
      {
        "id": "2",
        "type": "custom-text",
        "customText": "(",
        "color": "brightBlack",
        "merge": "no-padding"
      },
      {
        "id": "3",
        "type": "context-percentage",
        "color": "brightBlack",
        "rawValue": true,
        "merge": "no-padding"
      },
      {
        "id": "4",
        "type": "custom-text",
        "customText": ")",
        "color": "brightBlack",
        "merge": "no-padding"
      }
    ],
    [],
    []
  ],
  "flexMode": "full-minus-40",
  "compactThreshold": 60,
  "colorLevel": 2,
  "defaultSeparator": " ",
  "inheritSeparatorColors": false,
  "globalBold": false,
  "powerline": {
    "enabled": false,
    "separators": [" "],
    "separatorInvertBackground": [false],
    "startCaps": [],
    "endCaps": [],
    "autoAlign": false
  }
}
```

This configures four widgets on one line: a bold yellow [token](https://www.aihero.dev/ai-coding-dictionary/token) count (`context-length`), followed by a dimmed percentage in parentheses. The `"merge": "no-padding"` on the parentheses and percentage widgets glues them together without extra spacing, while `"defaultSeparator": " "` adds a space between the token count and the opening parenthesis. `"rawValue": true` strips the labels so you get clean numbers.

### Update Claude Code Settings

- [ ] Open `~/.claude/settings.json`

If this file doesn't exist yet, create it.

- [ ] Add the status line configuration

```json
{
  "statusLine": {
    "type": "command",
    "command": "npx ccstatusline@latest"
  }
}
```

Preserve any other settings that might already exist in this file. Claude Code pipes session data to this command automatically - `ccstatusline` reads it and outputs the formatted status line.

### Test Your Setup

- [ ] Restart Claude Code completely

Close the application fully and reopen it.

- [ ] Check your status line

You should now see a bold yellow token count followed by a dimmed percentage (like `186.2k (17.3%)`) displayed in your Claude Code status line. These numbers update as your context window fills during your session.

## Your Turn

`ccstatusline` is specific to Claude Code. Status lines aren't universal - some agents show context usage natively, some need a hook wired up, and some don't expose it at all.

- [ ] Copy this prompt and paste it into your agent of choice

```
Does my current harness expose a status line, footer, or persistent UI element I can customize? Check its docs or config for something like a status line hook or command, and tell me whether it can show live context-window-used percentage. If there's no hook but there's a built-in indicator already, tell me where to look instead. Walk me through enabling it if it needs setup.
```

If you get stuck, or want to share what you found, ask in the [Discord](https://aihero.dev/discord).
