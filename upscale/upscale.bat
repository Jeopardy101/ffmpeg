:Loop
timeout 1
for %%a in ("*.mp4") do (
	ffmpeg -i "%%a" -vf scale=3840:2160:flags=neighbor -preset fast -r 60 -profile high -rc constqp -qp 13 -c:a:0 copy -b:a 384k "..\Upscaled\%%~na upscaled.mp4"
	if not %errorlevel% equ 0 goto :Loop
)