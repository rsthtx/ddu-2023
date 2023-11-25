## Export and host on web

- https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_web.html
- https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cross-Origin-Embedder-Policy

> Error  
> The following features required to run Godot projects on the Web are missing:  
> Cross Origin Isolation — Check web server configuration (send correct headers)  
> `SharedArrayBuffer` — Check web server configuration (send correct headers)”

This means two headers are missing from the web server where the game is hosted. Those are:

Cross-Origin-Embedder-Policy: require-corp   
Cross-Origin-Opener-Policy: same-origin

#### Work-around
1. Download `coi-serviceworker.js` (or `coi-serviceworker.min.js`).
2. Put it next to your index file (or in any folder above it)
3. Add to your HTML file:
    
    ```html
    <script src="coi-serviceworker.js"></script>
    ```

- https://github.com/gzuidhof/coi-serviceworker