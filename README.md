# IFTTT WEBHOOK ACTION

![License][license-image]
![Issues][issues-image]

A GitHub action that triggers an [IFTTT webhooks](https://ifttt.com/maker_webhooks) event. This is useful for example when you want to trigger a IFTTT webhook after your ci succeeds.

## Keys

- `key` ifttt webhook key.
- `event` The name of the event, like "button_pressed" or "front_door_opened". Use only letters, numbers, and underscores.
- `value1` The data is completely optional, and you can also pass value1, value2, and value3 as query parameters or form variables. This content will be passed on to the action in your Applet.
- `value2` The data is completely optional, and you can also pass value1, value2, and value3 as query parameters or form variables. This content will be passed on to the action in your Applet.
- `value3` The data is completely optional, and you can also pass value1, value2, and value3 as query parameters or form variables. This content will be passed on to the action in your Applet.


## Usages

```yaml
steps:
  - name: IFTTT Webhook.
    uses: funnyzak/ifttt-webhook-maker-action@master
    with:
      key: ${{ secrets.IFTTT_KEY }}
      event: notify
      value1: hi
      value2: hello
      value3: wolf
```

read __README.md__ and hook。

```yaml
steps:
  - name: Checkout Source
    uses: actions/checkout@v1
  - id: GetReadMe
    run: |
      readme_content=`cat ./README.md`
      readme_content="${readme_content//'%'/'%25'}"
      readme_content="${readme_content//$'\n'/'%0A'}"
      readme_content="${readme_content//$'\r'/'%0D'}"
      echo "::set-output name=body::$readme_content"
  - name: IFTTT Webhook
    uses: funnyzak/ifttt-webhook-maker-action@master
    with:
      key: ${{ secrets.IFTTT_KEY }}
      event: notify
      value1: ${{ steps.GetReadMe.outputs.body }}
```

## License

MIT License © 2021 [funnyzak](https://github.com/funnyzak)

[license-image]: https://img.shields.io/static/v1?label=licence&message=MIT&color=Green
[issues-image]: https://img.shields.io/github/issues/funnyzak/jishida-action
