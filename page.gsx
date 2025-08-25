"use client";

import React, { useState, useEffect } from "react"; import { Button } from "@/components/ui/button"; import { Card, CardContent } from "@/components/ui/card";

export default function Sayumi() { const [time, setTime] = useState(25 * 60); // default 25 minutes const [isRunning, setIsRunning] = useState(false); const [sessionEnded, setSessionEnded] = useState(false); const [userInput, setUserInput] = useState(""); const [aiResponse, setAiResponse] = useState(""); const [mode, setMode] = useState("tutor");

useEffect(() => { let timer; if (isRunning && time > 0) { timer = setInterval(() => setTime((t) => t - 1), 1000); } else if (time === 0) { setIsRunning(false); setSessionEnded(true); } return () => clearInterval(timer); }, [isRunning, time]);

const formatTime = (seconds) => { const m = Math.floor(seconds / 60); const s = seconds % 60; return ${m}:${s.toString().padStart(2, "0")}; };

const handleStart = () => { setIsRunning(true); setSessionEnded(false); setTime(25 * 60); setAiResponse(""); };

const handleCheck = () => { let response = ""; if (mode === "tutor") { response = 📚 Tutor Mode: Great effort! Here's a more formal correction of your notes → ${userInput} [AI suggests improvements].; } else if (mode === "buddy") { response = 🎀 Buddy Mode: Nice one! You're doing great 🤗. Here's a little boost for what you wrote → ${userInput} [AI adds extra info].; } else if (mode === "sassy") { response = 😏 Sassy Mode: Okay smarty pants, here's the real deal → ${userInput} [AI roasts & corrects playfully].; } setAiResponse(response); };

return ( <div className="min-h-screen flex flex-col items-center justify-center bg-gradient-to-br from-purple-100 via-pink-100 to-blue-100 p-6"> <Card className="w-full max-w-md shadow-xl rounded-2xl p-6 bg-white/80"> <CardContent className="flex flex-col items-center gap-4"> <h1 className="text-3xl font-bold text-purple-700">Sayumi 🤖</h1> <p className="text-sm text-gray-600">Your AI Pomodoro Study Buddy</p>

<div className="text-6xl font-mono text-gray-800">{formatTime(time)}</div>

      <div className="flex gap-2">
        <Button onClick={handleStart} disabled={isRunning}>
          {isRunning ? "Running..." : "Start Session"}
        </Button>
      </div>

      {sessionEnded && (
        <div className="w-full flex flex-col gap-3">
          <label className="text-sm font-semibold text-gray-700">Choose Sayumi's Mood:</label>
          <select
            className="p-2 rounded-xl border"
            value={mode}
            onChange={(e) => setMode(e.target.value)}
          >
            <option value="tutor">📚 Tutor</option>
            <option value="buddy">🎀 Buddy</option>
            <option value="sassy">😏 Sassy</option>
          </select>

          <textarea
            className="w-full p-2 rounded-xl border"
            rows="4"
            placeholder="Write what you studied..."
            value={userInput}
            onChange={(e) => setUserInput(e.target.value)}
          />
          <Button onClick={handleCheck}>Check with Sayumi</Button>
          {aiResponse && (
            <div className="p-3 bg-white rounded-xl shadow">
              <p className="text-gray-700 whitespace-pre-line">{aiResponse}</p>
            </div>
          )}
        </div>
      )}
    </CardContent>
  </Card>
</div>

); }

