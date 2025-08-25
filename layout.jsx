// app/layout.jsx
export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>
        {children} {/* This is where your page content (from page.jsx) will be injected */}
      </body>
    </html>
  );
}
