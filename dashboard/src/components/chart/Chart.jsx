import "./chart.css";
import {
  LineChart,
  Line,
  XAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  YAxis,
  
} from "recharts";

export default function Chart({ title,data, dataKey, grid }) {
  return (
    <div className="chart">
      <h3 className="chartTitle">{title}</h3>
      <ResponsiveContainer width="60%" aspect={4 / 1}>
        <LineChart data={data} width={300} height={300} margin={{
            top: 5,
            right: 30,
            left: 20,
            bottom: 5,
          }}>
          <XAxis dataKey="name" stroke="#5550bd" />
          <YAxis/>
          <Line type="monotone" dataKey="pv" stroke="#5550bd" />
          <Line type="monotone" dataKey="uv" stroke="#5550bd" />
          <Tooltip />
          {grid && <CartesianGrid stroke="#505050" strokeDasharray="3 3" />}
        </LineChart>
      </ResponsiveContainer>
    </div>
  );
}