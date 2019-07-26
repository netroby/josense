<svg xmlns="http://www.w3.org/2000/svg" width="${totalWidth}" height="20">
    <linearGradient id="a" x2="0" y2="100%">
        <stop offset="0" stop-color="#bbb" stop-opacity=".1"/>
        <stop offset="1" stop-opacity=".1"/>
    </linearGradient>
    <rect rx="4" x="0" width="${totalWidth}" height="20" fill="#428bca"/>
    <rect rx="4" x="${titleWidth}" width="${progressWidth}" height="20" fill="#555"/>
    <rect rx="4" x="${titleWidth}" width="${width}" height="20" fill="${color}"/>
    <rect rx="4" width="${totalWidth}" height="20" fill="url(#a)"/>
    <g fill="#fff" text-anchor="middle" font-family="DejaVu Sans,Verdana,Geneva,sans-serif" font-size="11">
        <text x="${progressX}" y="15" fill="#010101" fill-opacity=".3">
            ${progress}${suffix}
        </text>
        <text x="${progressX}" y="14">
            ${progress}${suffix}
        </text>
    </g>
</svg>