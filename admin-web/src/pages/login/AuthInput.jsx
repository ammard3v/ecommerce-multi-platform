function AuthInput({ label, type, value, onChange, placeholder, light }) {
  return (
    <div>
      <label className={light ? "text-gray-700" : "text-gray-400"}>
        {label}
      </label>
      <input
        type={type}
        value={value}
        onChange={onChange}
        placeholder={placeholder}
        required
        className={`w-full px-4 py-2 rounded-lg border ${
          light
            ? "bg-white border-gray-300 text-black"
            : "bg-zinc-800 border-zinc-700 text-white"
        }`}
      />
    </div>
  );
}
export default AuthInput;
