import AuthInput from "./AuthInput";
function LoginForm({
  email,
  password,
  setEmail,
  setPassword,
  handleSubmit,
  message,
  isLoading,
}) {
  return (
    <form className="space-y-5" onSubmit={handleSubmit}>
      <AuthInput
        label="Email"
        type="email"
        value={email}
        onChange={(e) => setEmail(e.target.value)}
        placeholder="you@example.com"
        light
      />
      <AuthInput
        label="Password"
        type="password"
        value={password}
        onChange={(e) => setPassword(e.target.value)}
        placeholder="••••••••"
        light
      />
      <div className="min-h-[20px]">
        {message && (
          <div className="bg-red-100 rounded-lg p-3">
            <p className="text-sm text-red-600 text-center font-medium">
              {message}
            </p>
          </div>
        )}
      </div>
      <button
        type="submit"
        disabled={isLoading}
        className="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600 transition font-medium disabled:opacity-50 disabled:cursor-not-allowed"
      >
        {isLoading ? "Logging in..." : "Login"}
      </button>
    </form>
  );
}
export default LoginForm;
